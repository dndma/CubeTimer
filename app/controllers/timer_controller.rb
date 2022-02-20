# frozen_string_literal: true

# Main controller
class TimerController < ApplicationController
  def index
    @count = 0
    @solve = params[:v1]
    if @solve.to_f != 0.0
      MySolve.create_element(@solve, current_user.nil? ? 'Stranger' : current_user.email.to_s)
      redirect_to root_path
    end

    sum = []

    MySolve.where(scramble: (current_user.nil? ? 'Stranger' : current_user.email.to_s).to_s).each do |t|
      @count += 1
      sum << t.time
    end
    if sum.count >= 5
      @ao5 = 0
      @ao5 = get_ao(4, 5, sum)
    end

    @ao12 = get_ao(11, 12, sum) if sum.count >= 12

    @ao50 = get_ao(49, 50, sum) if sum.count >= 50

    @best = sum.min
    @worst = sum.max
  end

  def destroy
    if MySolve.last
      MySolve.last.delete
      redirect_to '/timer/solves'
    end
  end

  def get_ao(range, val, sum)
    ao = 0
    (0..range).each do |i|
      ao += sum[i]
    end
    ao /= val
    ao.round(2)
  end
end
