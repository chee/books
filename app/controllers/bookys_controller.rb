class BookysController < ApplicationController
  def new
  end

  def create
    pdf = params[:pdf]
    basename = File.basename(pdf.path, ".pdf")
    Dir.chdir('public')
    `/bin/make-booky #{pdf.path}`
    bookyname = "#{basename}.booky.pdf"
    outname = "#{File.basename(pdf.original_filename, ".pdf")}.booky.pdf"
    File.rename(bookyname, outname)
    File.open(outname) do |file|
        send_data file.read.force_encoding('BINARY'), filename: outname, type: 'application/pdf', disposition: 'attachment'
    end
  end
end
