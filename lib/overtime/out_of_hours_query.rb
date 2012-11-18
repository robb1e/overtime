require 'grit'

module Overtime
  class OutOfHoursQuery

    def initialize(repo, options = {})
      @repo = repo
      @branch = options.fetch(:branch, 'master')
      @count = options.fetch(:count, @repo.commit_count)
      @start = options.fetch(:start, 9)
      @end = options.fetch(:end, 18)
    end

    def run
      @repo.commits(@branch, @count).select do |commit|
        out_of_hours?(commit)
      end
    end

    private
    def out_of_hours?(commit)
      commit.authored_date.wday > 5 ||
        commit.authored_date.hour < @start ||
        commit.authored_date.hour > @end
    end

  end
end
