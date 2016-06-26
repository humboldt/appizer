require 'rails_helper'

describe Nice::ViewableHelper, type: :helper do
  describe "#nice_link" do
    before(:each) do
      I18n.locale = :fr
      helper.instance_variable_set(:@virtual_path, 'nice/pages/page')
      helper.class.send(:define_method, :nice_edit_mode?) { true }
    end

    context "without name, min = 1" do
      subject { helper.nice_link(1) }
      it { expect(subject.count).to eql(1) }
    end

    context "with name = 0, min = Float::INFINITY and without max" do
      subject { helper.nice_link('test', Float::INFINITY) }
      it { expect { subject }.to raise_exception("'min' can not be Float::INFINITY") }
    end

    context "with min = 0 and without max" do
      subject { helper.nice_link('test', 0) }
      it { expect { subject }.to raise_exception("if 'max' is not defined, 'min' must be greater than 0") }
    end

    context "with min = 1 and max = 0" do
      subject { helper.nice_link('test', 0, 0) }
      it { expect { subject }.to raise_exception("'max' must be greater than 0 or nil") }
    end

    context "without min and max" do
      subject { helper.nice_link('test') }
      it { is_expected.to respond_to(:edit_link, :sortable, :sortable_html) }
      it { expect(subject.edit_link).to match /<a data-js-nice-editable-id="\d" class="nice-edit nice-edit-viewable-link" data-no-turbolink="true" href=".+">/ }
    end

    context "with min = 0 and max = Float::INFINITY" do
      subject { helper.nice_link('test', 0, Float::INFINITY) }
      it { is_expected.to respond_to(:edit_links, :add_link, :sortable, :sortable_html) }
      it { expect(subject.count).to eql(0) }
      it { expect(subject.add_link).to match /<a class="nice-add" data-no-turbolink="true" href=".+">/ }
      it { expect(subject.sortable_html).to match /data-js-nice-sortable={\".+\"}/ }
    end

    context "with min = 2 and max = 2" do
      subject { helper.nice_link('test', 2, 2) }
      it { expect(subject.count).to eql(2) }
      it { expect(subject.add_link).to be_nil }
      it { expect(subject.edit_links).to match /<ul data-js-nice-sortable=\"{.+}\" class="nice-edit-links"><li data-js-nice-sortable-id="\d">/ }
    end

    context "with min = 2 and without max" do
      subject { helper.nice_link('test', 2, 2) }
      it { expect(subject.count).to eql(2) }
      it { expect(subject.add_link).to be_nil }
    end

    context "with min = 3 and max = Float::INFINITY" do
      subject { helper.nice_link('test', 3, Float::INFINITY) }
      it { expect(subject.count).to eql(3) }
      it { expect(subject.add_link).to be_truthy }
    end
  end
end
