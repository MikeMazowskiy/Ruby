class PagesController < ApplicationController
  def about
    @heading = 'This page is about us'
    @text = 'Some text, nothing special'
  end
end
