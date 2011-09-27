class PagesController < ApplicationController
  def show
    path = Pathname.new "/#{params[:id]}"
    render :template => "pages/#{path.cleanpath.to_s[1..-1]}"
  end
end
