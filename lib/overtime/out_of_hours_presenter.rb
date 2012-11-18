module Overtime
  class OutOfHoursPresenter

    def initialize(commit, start, finish)
      @commit = commit
      @start = start
      @finish = finish
    end

    def to_s
      if weekend?
        "This commit -#{@commit.id_abbrev}- by #{@commit.author} took place at the weekend"
      elsif before_start?
        "This commit -#{@commit.id_abbrev}- by #{@commit.author} took place before 9am at #{@commit.authored_date}"
      elsif after_finish?
        "This commit -#{@commit.id_abbrev}- by #{@commit.author} took place after 6pm at #{@commit.authored_date}"
      else
        "This commit -#{@commit.id_abbrev}- is OK at #{@commit.authored_date}"
      end
    end

    private

    def weekend?
      day = @commit.authored_date.wday
      day == 0 || day == 6
    end

    def before_start?
      @commit.authored_date.hour < @start
    end

    def after_finish?
      @commit.authored_date.hour > @finish
    end

  end
end
