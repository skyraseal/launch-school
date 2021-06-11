def minilang(user_input)
  numbers = %w(0 1 2 3 4 5 6 7 8 9 -)
  operations = %w(ADD SUB MULT DIV MOD).map(&:downcase)
  register = 0
  stack = []

  sequence = user_input.split
  sequence.each do |command|
    command = command.downcase
    case
    when command.start_with?(*numbers)
      register = command.to_i
    when operations.include?(command)
      register = cmd_op(stack, register, command)
    when command == 'push'
      stack.push register
    when command == 'pop'
      register = stack.pop
    when command == 'print'
      puts register
    end
  end
end

def cmd_op(stack, register, operation)
  register = case operation.downcase
               when 'add' then register + stack.pop
               when 'sub' then register - stack.pop
               when 'mult' then register * stack.pop
               when 'div' then register / stack.pop
               when 'mod' then register % stack.pop
             end
  register
end

minilang('5 PUSH 3 MULT PRINT')
