class PoemController < ApplicationController
  def index
    @example_poem = File.read('resources/example_poem.txt')
  end

  def show
    @url = request.url
    @poem = Transform::Poem.decode(poem_show_params)
              .gsub(/\r\n/, '<br>')
  end

  def create
    encoded = Transform::Poem.encode(poem_create_params)
    redirect_to poem_show_path(hash: encoded)
  end

  def error
  end

  private
  def poem_create_params
    params.require(:poem)
  end

  def poem_show_params
    params.require(:hash)
  end
end
