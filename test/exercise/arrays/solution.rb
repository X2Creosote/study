module Exercise
  module Arrays
    class << self
      def replace(array)
        ar_len = array.size - 1
        max = 0
        while ar_len.positive? do
          if array[ar_len] > max
            max = array[ar_len]
          end
          ar_len -= 1
        end
        while ar_len < array.size do
          if array[ar_len].positive? && array[ar_len] < max
            array[ar_len] = max
          end
          ar_len += 1
        end
        array
      end

      def search(_array, _query)
        # cheesing a little bit <3
        def find(_array, _query, first, last)
          mid = first + (last - first) / 2.0
          if _array[mid] == _query
            mid.to_i
          elsif _array[mid] > _query && _array[mid - 1] + 1 != _query
            last = mid
            find(_array, _query, first, last)
          elsif _array[mid] < _query && _array[mid + 1] - 1 != _query
            first = mid
            find(_array, _query, first, last)
          else -1
          end
        end
        # sanity check by size
        if _array.size.zero?
          return -1
        end
        # single num array case
        if _array.size == 1
          if _array[0] == _query
            return 0
          else return -1
          end
        end
        # an actual algorithm
        first = 0
        last = _array.size - 1
        find(_array, _query, first, last)
      end
    end
  end
end
