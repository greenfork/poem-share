class PoemController < ApplicationController
  def index
    @example_poem = File.read('resources/example_poem.txt')
    @size_limit = Transform::Poem::SIZE_LIMIT
  end

  def show
    @poem = Transform::Poem.decode(poem_show_params)
              .gsub(/\r\n/, '<br>')
    @url = request.url
  rescue ArgumentError
    show_error_stubs
    render status: :not_found
  end

  def create
    if poem_create_params.size > Transform::Poem::SIZE_LIMIT
      redirect_to :root and return
    end

    encoded = Transform::Poem.encode(poem_create_params)
    redirect_to poem_show_path(hash: encoded)
  end

  private
  def poem_create_params
    params.require(:poem)
  end

  def poem_show_params
    params.require(:hash)
  end

  def show_error_stubs
    @poem = "The address appears to be incorrect, " +
            "try to copy the link one more time."
    @url = "Wrong link, sorry!"
  end
end
