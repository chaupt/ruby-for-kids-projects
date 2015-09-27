class Game

    attr_reader :players, :deck, :bank, :round

    ANTE_AMOUNT = 1

    def initialize(players)
        @players = players
        @deck = Deck.new(Card.create_cards)
        @deck.shuffle
        @bank = 0
        @round = 0
    end

    def remaining_players
        players.count {|player| !player.eliminated?}
    end

    def play
        while deck.size > (players.length * 3) && remaining_players > 1 do
            new_round
            puts "--------------------------------------------"
            puts "Round #{round}! The dealer has #{bank} chips."
            puts "--------------------------------------------"
            puts "Everyone antes"
            ante
            puts "The dealer now has #{bank} chips."
            deal_cards(2)
            sort_cards
            puts "---> Current cards:"
            puts ""
            show_cards
            puts "---> Players bet:"
            puts ""
            players_bet
            puts ""
            puts "---> Dealer deals one more card"
            puts ""
            deal_cards(1)
            show_cards
            puts ""
            puts "---> Determining results"
            puts ""
            determine_results
            puts ""
            puts "---> New standings"
            puts ""
            show_player_chips
            puts ""
            puts ""
        end
        game_over
    end

    def new_round
        @round += 1
        players.each do |player|
            player.discard_hand
        end
    end

    def ante
        players.each do |player|
            if not player.eliminated?
                @bank = @bank + player.pay(ANTE_AMOUNT)
            end
        end
    end

    def deal_cards(num_of_cards)
        players.each do |player|
            next if player.eliminated?
            1.upto(num_of_cards) do
                player.take_card(deck.deal)
            end
        end
    end

    def sort_cards
        players.each do |player|
            next if player.eliminated?
            player.sort_hand_by_rank
        end
    end

    def players_bet
        players.each do |player|
            if player.eliminated?
                puts "#{player.name} passes. (Out of chips!)"
            else
                print "#{player.name} can bet between 0 and #{max_bet(player)}: "
                bet = gets.to_i
                if bet < 0 || bet > max_bet(player)
                    bet = 0
                end
                puts "#{player.name} bet #{bet}"
                player.bet = bet
            end
        end
    end

    def show_player_chips
        players.each do |player|
            if player.eliminated?
                puts "#{player.name} has been eliminated"
            else
                puts "#{player.name} has #{player.chips} chips"
            end
        end
    end

    def show_cards
        players.each do |player|
            puts "#{player.name}"
            if player.eliminated?
                puts "#{player.name} has been eliminated"
            else
                player.hand.each do |card|
                    puts card.to_s
                end
            end
            puts ""
        end
    end

    def max_bet(player)
        [player.chips, bank].min
    end

    def determine_results
        players.each do |player|
            if not player.eliminated?
                low_card = player.hand[0]
                high_card = player.hand[1]
                middle_card = player.hand[2]
                if Card.compare_rank(low_card, middle_card) == 0 || Card.compare_rank(high_card,middle_card) == 0
                    puts "#{player.name} got an exact match, loses twice the bet!"
                    chips = player.pay(player.bet * 2)
                elsif Card.compare_rank(middle_card, low_card) < 0 || Card.compare_rank(middle_card, high_card) > 0
                    puts "#{player.name} wasn't inbetween loses the bet!"
                    chips = player.pay(player.bet)
                else
                    puts "#{player.name} wins bet!"
                    chips = -player.bet
                    player.win(player.bet)
                end
                @bank = @bank + chips
                if @bank <= 0
                    puts "Dealer is out of chips, everyone needs to ante up!"
                end
                while @bank <= 0
                    ante
                end
             end
        end
    end

    def game_over
        puts "Game Over!"
        players.sort! do |player1, player2|
            player1.chips <=> player2.chips
        end
        puts "The winner is #{players.last.name}"
    end

end

# Check to see if player has enough chips to play that round, she needs at
            # least ANTE + 1, why?
