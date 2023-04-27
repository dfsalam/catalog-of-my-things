require_relative '../classes/label'

describe Label do
  before :each do
    @label = Label.new('New title', 'red')
  end

  describe '#new' do
    it 'should be label object' do
      expect(@label).to be_an_instance_of Label
    end
  end

  describe 'it shoudld return the correct value for property' do
    it 'should return the correct title' do
      title = @label.title
      expect(title).to eql('New title')
    end
    it 'should return the correct color' do
      color = @label.color
      expect(color).to eql('red')
    end
  end

  describe '#add_item' do
    it 'should add an item' do
      item = double('Item')

      allow(item).to receive(:label=) { @label }

      @label.add_item(item)
      expect(@label.items).to include(item)
    end
  end

  describe '#add_label' do
    let(:label1) { Label.new('Label 1', 'red') }
    let(:label2) { Label.new('Label 2', 'green') }
    let(:label3) { Label.new('Label 3', 'blue') }

    it "adds a label to the label's list of labels" do
      label1.add_label(label2)
      expect(label1.labels).to include(label2)
    end

    it 'does not add the same label twice' do
      label1.add_label(label2)
      label1.add_label(label2)
      expect(label1.labels.count).to eq(1)
    end

    it "adds multiple labels to the label's list of labels" do
      label1.add_label(label2)
      label1.add_label(label3)
      expect(label1.labels.count).to eq(2)
      expect(label1.labels).to include(label2)
      expect(label1.labels).to include(label3)
    end
  end
end
