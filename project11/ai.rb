class AI
  def move(game, num_disks, start, target, temp)
    Fiber.yield
    sleep(0.1)
    if num_disks == 1
      target.move_disc(start.last)
      game.increment_clicks
    else
      move(game, num_disks-1, start, temp, target)
      move(game, 1,           start, target, temp)
      move(game, num_disks-1, temp, target, start)
    end
  end
end
