require 'rails_helper'

RSpec.describe ImportationJob, type: :job do
  let(:importation) { Importation.create(content: File.read(Rails.root.join('spec/fixtures/files/cnab.txt'))) }

  describe '#perform' do
    it 'enqueues a job to import on default queue' do
      expect { described_class.perform_later(importation.id) }.to have_enqueued_job.on_queue(:default)
    end

    it 'executes the job' do
      allow(ImportCnab).to receive(:call).and_call_original

      perform_enqueued_jobs { described_class.perform_later(importation.id) }
      expect(ImportCnab).to have_received(:call).with(importation.content)
    end
  end
end
