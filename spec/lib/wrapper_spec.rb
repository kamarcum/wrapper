require 'spec_helper'

describe Wrapper do
  let(:article) { Article.new(:title => 'I should not be seen!', :description => 'I will not be touched') }
  subject { ArticlePresenter.wrap(article) }

  describe ".wrap" do
    it "returns an instance of the newly created or existing presenter class" do
      resource = Article.new

      ArticlePresenter.wrap(resource).should be_a ArticlePresenter
    end

    it "returns a wrapped instances for each resource in the given array" do
      collection = [Article.new, Article.new]

      wrapped_resources = ArticlePresenter.wrap(collection)

      wrapped_resources.should respond_to :each
      wrapped_resources.map(&:class).uniq.should == [ArticlePresenter]
    end
  end

  describe "#new" do
    it "needs an object to instantiate" do
      subject
      expect { ArticlePresenter.new }.to raise_error(ArgumentError)
    end

    it "sets the #resource attribute" do
      ArticlePresenter.new(article).resource.should eq article
    end
  end

  describe "#model" do
    it "returns the subject's class" do
      subject.model.should eq Article
    end
  end

  describe '#== (comparison)' do
    it 'is true when compared to other presenter objects' do
      (subject == subject).should be_true
    end

    it 'is true when comparing presenter with resource' do
      (subject == article).should be_true
    end
  end

  context 'presenter specific method' do
    it "uses methods defined in the presenter class" do
      subject.title.should eq "I was overwritten in the presenter"
    end

    it "uses the model's instance method if there is no corresponding method in presenter class" do
      subject.description.should eq "I will not be touched"
    end

    it "responds to public methods defined on the resource" do
      subject.should respond_to :description
      subject.should_not respond_to :a_private_method
    end
  end
end
