class Api::SudokusController < ApplicationController

    def create
        board = JSON.parse(params["data"])
        solution = SudokuSolve.new(*board).solve
        render json: {solution: solution}
    end
end
