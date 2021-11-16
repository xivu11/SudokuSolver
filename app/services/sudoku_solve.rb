class SudokuSolve

    def initialize(b1,b2,b3,b4,b5,b6,b7,b8,b9)
        @board = Array.new(9)
        @board[0]=b1
        @board[1]=b2
        @board[2]=b3
        @board[3]=b4
        @board[4]=b5
        @board[5]=b6
        @board[6]=b7
        @board[7]=b8
        @board[8]=b9
    end
    
    def isFull?
        for i in 0..8
            for j in 0..8
                if @board[i][j]==0 || @board[i][j].blank?
                    return false
                end
            end
        end
        return true
    end

    def possibleEntries(i,j)
        pe=[1,2,3,4,5,6,7,8,9]
        for k1 in 0..8
            pe.delete(@board[i][k1]) if @board[i][k1].present? && @board[i][k1]!=0
        end
        for k2 in 0..8
            pe.delete(@board[k2][j]) if @board[k2][j].present? && @board[k2][j]!=0
        end
        str=(i/3)*3
        stc=(j/3)*3
        for a in (str..str+2)
            for b in (stc..stc+2)
                pe.delete(@board[a][b]) if @board[a][b].present? && @board[a][b]!=0
            end
        end
        return pe
    end

    def solve
        if isFull?
            print "Board solved successfully!"
            return true
        else
            i=-1
            j=-1
            for a in 0..8
                for b in 0..8
                    if @board[a][b]==0 || @board[a][b].blank?
                        i=a
                        j=b
                        break
                    end
                end
                break if i>-1
            end
            pe=Array.new
            pe=possibleEntries(i,j)
            pe.each do |num|
                @board[i][j]=num
                return @board if solve 
            end
            @board[i][j]=0
        end
        false
    end
    
end
