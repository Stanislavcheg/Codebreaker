module Codebreaker
  # Generator for the hint and secret code
  module Generator
    def generate_code(length = 4, range = 1..6)
      code = ''
      length.times do
        rand_number = rand range
        code += rand_number.to_s
      end
      code
    end

    def generate_hint(code_length = 4)
      rand_number = rand 0...code_length
      @secret_code[rand_number]
    end
  end
end
