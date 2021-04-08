module ScoreKeeping
  extend ActiveSupport::Concern

  included do
    helper_method :show_score?
  end

  private

  def show_score?
    @score && @score.attempts > 0
  end

  def restore_score_from_session
    correct = session[:score_correct].try(:to_i) || 0
    attempts = session[:score_attempts].try(:to_i) || 0

    @score = Score.new(correct: correct, attempts: attempts)
  end

  def save_score_to_session
    return unless @score

    session[:score_correct] = @score.correct
    session[:score_attempts] = @score.attempts
  end
end
