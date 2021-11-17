class Api::SudokusController < ApplicationController

    def create
        board = if params["data"].is_a?(String)
            JSON.parse(params["data"]) 
        else
            params["data"].dup
        end
        solution = SudokuSolve.new(*board).solve
        render json: {solution: solution}
    end
    # curl --location --request POST 'http://localhost:3000/api/sudoku' --header 'Content-Type: application/json' --data-raw '{"data": "[[2, null, 5, null, null, 9, null, null, 4],[null, null, null, null, null, null, 3, null, 7],[7, null, null, 8, 5, 6, null, 1, null],[4, 5, null, 7, null, null, null, null, null],[null, null, 9, null, null, null, 1, null, null],[null, null, null, null, null, 2, null, 8, 5],[null, 2, null, 4, 1, 8, null, null, 6],[6, null, 8, null, null, null, null, null, null],[1, null, null, 2, null, null, 7, null, 8]]"}'

end
