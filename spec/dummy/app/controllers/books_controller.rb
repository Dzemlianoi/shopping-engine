# frozen_string_literal: true

class BooksController < ApplicationController
  helper_method :book_params

  load_resource :category
  load_resource :book, only: :show
  load_and_authorize_resource through: :category, only: :index, if: -> { !@category.nil? }
  load_and_authorize_resource only: :index, if: -> { @category.nil? }

  def index
    @paginator = PaginatorService.new(params, @category)
    @books = @books.order(ordering).limit(@paginator.limiting)
  end

  def show
    @reviews = @book.reviews.approved.decorate
  end

  private

  def ordering
    order = book_params.key?(:order) ? book_params[:order].to_sym : nil
    Book::ORDERING.key?(order) ? Book::ORDERING[order] : Book.default_sort
  end

  def book_params
    params.permit(:page, :id, :order)
  end
end
