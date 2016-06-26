require 'rails_helper'

describe Nice::ViewHelper, type: :helper do
  describe "#nice_body_class" do
    before(:each) do
      I18n.locale = :fr
      allow(controller).to receive(:action_name).and_return('show')
      allow(params).to receive(:[]).with(:nice_view_type).and_return('page')
      helper.class.send(:define_method, :nice_edit_mode?) { true }
    end

    it "generate contextual classes" do
      expect(helper.nice_body_class).to eql("page nice-view nice-view-show fr nice-edit-mode")
    end

    it "adds other classes" do
      expect(helper.nice_body_class('one', 'two')).to eql("page nice-view nice-view-show fr nice-edit-mode one two")
    end
  end
end
