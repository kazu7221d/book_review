class LibraryController < ApplicationController
  def library
    if params[:str] != nil
      @books = Book.where(title: params[:str]).find_each(batch_size: 10)
    else
      @books = Book.all.find_each(batch_size: 10)
    end
  end

end
