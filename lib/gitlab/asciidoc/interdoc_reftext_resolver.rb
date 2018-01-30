# frozen_string_literal: true

module Gitlab
  module Asciidoc
    # Resolver of implicit reference text (label) for inter-document cross references.
    class InterdocReftextResolver < Asciidoctor::InterdocReftext::Resolver

      override :initialize
      def initialize(document, repository_tree:, **)
        super(document, logger: Gitlab::AppLogger, raise_exceptions: false)
        @repository_tree = repository_tree
      end

      protected

      override :resolve_target_path
      def resolve_target_path(target_path)
        @repository_tree.resolve_relative_path(target_path + '.adoc')
      end

      override :read_file
      def read_file(filename)
        yield @repository_tree.read_blob(filename)&.each_line
      end
    end
  end
end
