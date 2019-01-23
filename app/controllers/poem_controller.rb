class PoemController < ApplicationController
  def index
    @example_poem = File.read('resources/example_poem.txt')
  end

  def show
  end

  def create
  end

  def error
  end
end
