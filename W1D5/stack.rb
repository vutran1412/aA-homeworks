class Stack

    def initialize
        @stack = []
    end

    def push(el)
        @stack.push(el)
    end

    def pop
        @stack.drop(1)
    end

    def peek
        puts @stack.last
    end

end