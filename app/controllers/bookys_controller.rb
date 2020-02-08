class BookysController < ApplicationController
  def new
  end

  def create
    pdf = params[:pdf]
    basename = File.basename(pdf.path)
    Dir.chdir('/tmp')
    `/usr/chee/projects/booky/make-booky #{basename}`
    File.open("/tmp/#{basename}.booky.pdf") do |file|
      puts file
      send_data file.read.force_encoding('BINARY'), filename: "#{pdf.original_filename}.booky.pdf", type: 'application/pdf', disposition: 'attachment'
    end
  end
end
