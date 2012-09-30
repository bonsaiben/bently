module Bently

  module CLO
    TAB_SPACES = 6

    protected

    # prompt arrow
    def bullet(text); puts "#{magenta('==>')} #{bold(text)}" end
    def listout(text,num); puts magenta("#{num}. #{text}") end

    # blockquote
    def blockquote text
      text = text.split("\n") unless text.is_a?(Array)
      text.each do |text|
        puts tab(text)
      end
    end

    # colorizes text
    def colorize(text, color_code)
      "#{color_code}#{text}\033[0m"
    end

    def red(text); colorize(text, "\033[31m"); end
    def green(text); colorize(text, "\033[32m"); end
    def magenta(text); colorize(text, "\033[35m"); end
    def light_green(text); colorize(text, "\033[32m"); end
    def bold(text); "\033[1m#{text}\033[22m"; end
    def tab(text); "#{' '*TAB_SPACES}#{text}" end
  end

end
