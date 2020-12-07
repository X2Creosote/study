module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        0.upto(self.length - 1) do |x|
          yield self[x] 
        end
        
        return self
      end

      # Написать свою функцию my_map
      def my_map
        arr = MyArray.new()

        return self.my_reduce(arr) { |total, current| total << yield(current) }
      end

      # Написать свою функцию my_compact
      def my_compact
        arr = MyArray.new()
        i = 0
        self.reduce(arr) do |total, current|
           if !current.nil?
             arr[i] = current
             i += 1
           end
        end
        arr
      end

      # Написать свою функцию my_reduce
      def my_reduce(acc = nil)
        if acc == nil
          acc = self[0]
          self[1..-1].my_each do |element|
            acc = yield acc, element
          end
        else
          my_each do |element|
            acc = yield acc, element
          end
        end

        return acc
      end
    end
  end
end
