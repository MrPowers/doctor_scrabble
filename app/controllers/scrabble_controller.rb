class ScrabbleController < ApplicationController

  def index
  end

  def fetch_words
    respond_to do |format|
      format.json do
        letters = params[:letters].split("") + params[:contains].split("")
        picker = ActionScrabble::WordPicker.new(letters, procs)
        @words = picker.filtered_words
        render :json => @words
      end
    end
  end

  private

  def procs
    [start_with, end_with, contains]
  end

  def start_with
    Proc.new {|x| x.start_with? params[:start_with]}
  end

  def end_with
    Proc.new {|x| x.end_with? params[:end_with]}
  end

  def contains
    Proc.new {|x| x.include? params[:contains]}
  end

end
