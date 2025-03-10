from confluent_kafka.schema_registry import SchemaRegistryClient, Schema
from confluent_kafka.schema_registry.protobuf import ProtobufSerializer
# from confluent_kafka.schema_registry.Schema

# serializer = ProtobufSerializer()

def register_schema():

    with open('message.proto', 'r') as file:
        file_content = file.read()

    schema = Schema.from_dict({
        'schema': file_content,
        'subject_name': 'PROTOBUF',
        })

    client = SchemaRegistryClient({
        'url': "http://localhost:8081"
    })

    schema = client.get_schema(1, 'acme')

    print(f'Client: {schema}')


if __name__ == '__main__':
    register_schema()
