module TurboPreview
  extend ActiveSupport::Concern

  included do
    helper_method :skip_preview?
  end

  private

  def skip_preview?
    @skip_preview
  end

  def skip_preview
    @skip_preview = true
  end
end
