require_relative '../../user'

RSpec.describe User do
  describe '#id' do
    context 'idがnilでない場合' do
      it 'present?がtrue' do
        john = User.new(1, 'john@example.com', 'p@ssw0rd')
        expect(john.present?).to eq true
      end
    end
    context 'idがnilの場合' do
      it 'present?がfalse' do
        john = User.new(nil, 'john@example.com', 'p@ssw0rd')
        expect(john.present?).to eq false
      end
    end
  end
end