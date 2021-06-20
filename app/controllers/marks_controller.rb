class MarksController < ApplicationController
  def create
    @post = Post.find params[:post_id]

    mark = Mark.new marks_params
    mark.letter =
      if mark.score > 90
        'A'
      elsif mark.score > 75
        'B'
      elsif mark.score > 60
        'C'
      elsif mark.score > 30
        'D'
      else
        'F'
      end
    @post.marks.create({ score: mark.score, letter: mark.letter })
    redirect_to post_path(@post)
  end

  private def marks_params
    params.require(:mark).permit(:score)
  end
end
