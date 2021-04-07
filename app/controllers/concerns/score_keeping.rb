module ScoreKeeping
  extend ActiveSupport::Concern

  included do
    before_action :restore_score_from_session
    after_action :save_score_to_session
  end

  private

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
