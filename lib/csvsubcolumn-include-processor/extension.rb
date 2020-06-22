require 'asciidoctor/extensions' unless RUBY_ENGINE == 'opal'

include Asciidoctor

# TODO Class came from URI Include Processor, replace later
class CsvSubcolumnIncludeProcessor < Extensions::IncludeProcessor
  def handles? target
    (target.start_with? 'http://') or (target.start_with? 'https://')
  end

  def process doc, reader, target, attributes
    content = (open target).readlines
    reader.push_include content, target, target, 1, attributes
    reader
  end

end