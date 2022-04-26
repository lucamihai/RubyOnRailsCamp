require "rspec"
require 'spec_helper'

require "./lib/request_body_parser.rb"

RSpec.describe RequestBodyParser do
  describe ".extract_arguments" do
    context "Given request with all arguments" do
      subject {
        request_body_contents = '{
          "original_image_path": "original.jpg",
          "final_image_path": "final.jpg",
          "text": "some funny text hahaha",
          "font": "Times New Roman",
          "fill_color": "Green",
          "under_color": "Blue",
          "point_size": "13",
          "gravity": "Left"
          }'
       
        RequestBodyParser.extract_arguments(request_body_contents) 
      }
      it "returns expected entity" do
        expect(subject.original_image_path).to eq "original.jpg"
        expect(subject.final_image_path).to eq "final.jpg"
        expect(subject.text).to eq "some funny text hahaha"
        expect(subject.font).to eq "Times New Roman"
        expect(subject.fill_color).to eq "Green"
        expect(subject.under_color).to eq "Blue"
        expect(subject.point_size).to eq 13
        expect(subject.gravity).to eq "Left"
      end
    end

    context "Given request with only required arguments" do
      subject {
        request_body_contents = '{
          "original_image_path": "original.jpg",
          "final_image_path": "final.jpg",
          "text": "some funny text hahaha"
          }'
       
        RequestBodyParser.extract_arguments(request_body_contents) 
      }
      it "returns expected entity" do
        expect(subject.original_image_path).to eq "original.jpg"
        expect(subject.final_image_path).to eq "final.jpg"
        expect(subject.text).to eq "some funny text hahaha"
        expect(subject.font).to eq "Arial"
        expect(subject.fill_color).to eq "White"
        expect(subject.under_color).to eq "Black"
        expect(subject.point_size).to eq 8
        expect(subject.gravity).to eq "Center"
      end
    end

    context "Given request with no arguments" do
      subject {
        request_body_contents = '{}'
        RequestBodyParser.extract_arguments(request_body_contents) 
      }
      it "returns expected entity" do
        expect(subject.original_image_path).to eq nil
        expect(subject.final_image_path).to eq nil
        expect(subject.text).to eq nil
        expect(subject.font).to eq "Arial"
        expect(subject.fill_color).to eq "White"
        expect(subject.under_color).to eq "Black"
        expect(subject.point_size).to eq 8
        expect(subject.gravity).to eq "Center"
      end
    end
  end
end
