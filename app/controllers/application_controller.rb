class ApplicationController < ActionController::Base
  include ScoreKeeping
  include TurboPreview
end
