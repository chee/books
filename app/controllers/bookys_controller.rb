class BookysController < ApplicationController
  def new
  end

  def create
    pdf = params[:pdf]
    basename = File.basename(pdf.path)
    Dir.mktmpdir do |dir|
        `/bin/make-booky #{pdf.path}`
        File.open("#{basename}.booky.pdf") do |file|
            send_data file.read.force_encoding('BINARY'), filename: "#{pdf.original_filename}.booky.pdf", type: 'application/pdf', disposition: 'attachment'
        end
    end
  end
end
