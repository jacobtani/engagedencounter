module UseCase
  extend ActiveSupport::Concern
  include ActiveModel::Validations

  module ClassMethods
    # The perform method of a UseCase should always return itself
    def perform(*args)
      new(*args).tap { |use_case| use_case.perform }
    end

    # raise an exception if perform generates any errors
    def perform!(*args)
      perform(*args).tap do |use_case|
        if use_case.failure?
          raise "Unexpected error #{use_case.errors.full_messages.join(', ')}"
        end
      end
    end

  end

  # implement all the steps required to complete this use case
  def perform
    raise NotImplementedError
  end

  # inside of perform, add errors if the use case did not succeed
  def success?
    errors.none?
  end

  def failure?
    errors.any?
  end
end
