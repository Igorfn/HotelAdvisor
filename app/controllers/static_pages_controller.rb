class StaticPagesController < ApplicationController

  def help
    render 'static_pages/help'
  end

  def about
    render 'static_pages/about'
  end

  def contact
    render 'static_pages/contact'
  end

  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
  end
end
