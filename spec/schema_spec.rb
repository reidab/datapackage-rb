describe DataPackage::Schema do

  context 'initialize' do

    it 'loads a schema from a hash' do
      schema_hash = {
        foo: 'bar'
      }
      schema = DataPackage::Schema.new(schema_hash)

      expect(schema).to eq(schema_hash)
      expect(schema['foo']).to eq(schema_hash['foo'])
    end

    it 'loads a schema from a path' do
      path = File.join('spec', 'fixtures', 'fake_schema.json')

      schema = DataPackage::Schema.new(path)

      expect(schema).to eq ({
        'key' => 'value'
      })
    end

    it 'loads a schema from a url' do
      url = 'http://example.org/thing.json'
      body = File.read File.join('spec', 'fixtures', 'fake_schema.json')

      FakeWeb.register_uri(:get, url, :body => body)

      schema = DataPackage::Schema.new(url)

      expect(schema).to eq ({
        'key' => 'value'
      })
    end

    it 'loads a schema from the registry' do
      schema = DataPackage::Schema.new(:base)

      expected = JSON.parse(File.read File.join File.dirname(__FILE__), '..', 'datapackage', 'schemas', 'data-package.json')
      expect(schema).to eq expected
    end

    context 'raises an error' do

      it 'when the path does not exist' do
        path = File.join('spec', 'fixtures', 'not_a_path.json')

        expect { DataPackage::Schema.new(path) }.to raise_exception { |exception|
          expect(exception).to be_a DataPackage::SchemaException
          expect(exception.status).to eq ("Path 'spec/fixtures/not_a_path.json' does not exist")
        }

      end

      it 'when the path is not json' do
        path = File.join('spec', 'fixtures', 'not_a_json')

        expect { DataPackage::Schema.new(path) }.to raise_exception { |exception|
          expect(exception).to be_a DataPackage::SchemaException
          expect(exception.status).to eq ("Schema is not valid JSON")
        }
      end

      it 'when the url is not json'

      it 'when the url does not exist'

      it 'when the schema is not a string or hash'

      it 'when the schema is invalid'

    end

  end

  context 'validate' do

    it 'validates correctly'

    it 'returns errors'

    it 'returns multiple errors'
    # test_iter_validation_returns_iter_with_each_validationerror

    it 'retuns no errors if data is valid'

  end

  it 'creates attributes for every toplevel attribute'

  it 'does not allow changing schema properties'

  it 'allows changing properties not in schema'

  it ' does not change the originals when changing properties'

end

#
# def test_to_dict_converts_schema_to_dict(self):
#     original_schema_dict = {
#         'foo': 'bar',
#     }
#     schema = Schema(original_schema_dict)
#     assert schema.to_dict() == original_schema_dict
#
# def test_to_dict_modifying_the_dict_doesnt_modify_the_schema(self):
#     original_schema_dict = {
#         'foo': 'bar',
#     }
#     schema = Schema(original_schema_dict)
#     schema_dict = schema.to_dict()
#     schema_dict['bar'] = 'baz'
#     assert 'bar' not in schema.to_dict()
# def test_properties_are_visible_with_dir(self):
#     schema_dict = {
#         'foo': {}
#     }
#     schema = Schema(schema_dict)
#     assert 'foo' in dir(schema)
#
#
# def test_schema_properties_doesnt_linger_in_class(self):
#     foo_schema_dict = {
#         'foo': {}
#     }
#     bar_schema_dict = {
#         'bar': {}
#     }
#     foo_schema = Schema(foo_schema_dict)
#     bar_schema = Schema(bar_schema_dict)
#
#     assert 'bar' not in dir(foo_schema)
#     assert 'foo' not in dir(bar_schema)
#
