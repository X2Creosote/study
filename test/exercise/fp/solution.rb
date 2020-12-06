module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        sorted_array = _array.reject { |film| film["rating_kinopoisk"].equal?(nil) }.reject { |film| film["rating_kinopoisk"].to_f == 0 }.select { |film| film["country"].to_s.include? "," }
        total_kino_rating = sorted_array.map { |film| film["rating_kinopoisk"].to_f }.reduce(0) { |sum, rating| sum + rating }
        total_num_of_valid_lines = sorted_array.reduce(0) { |sum| sum + 1 }
        total_kino_rating / total_num_of_valid_lines
      end

      def chars_count(_films, _threshold)
        _films.reject { |film| film["rating_kinopoisk"].equal?(nil) }.select { |film| film["rating_kinopoisk"].to_f >= _threshold }.select { |film| film["name"].downcase.include? 'и' }.map { |film| film["name"] }.reduce(0) { |sum, film_name| sum + film_name.count('и') }
      end
    end
  end
end
