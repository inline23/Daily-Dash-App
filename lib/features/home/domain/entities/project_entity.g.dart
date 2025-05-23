// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProjectEntityAdapter extends TypeAdapter<ProjectEntity> {
  @override
  final int typeId = 0;

  @override
  ProjectEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProjectEntity(
      id: fields[0] as String,
      title: fields[1] as String,
      description: fields[2] as String,
      status: fields[3] as String,
      dueDate: fields[4] as String,
      teamMembers: (fields[5] as List).cast<String>(),
      toDos: (fields[6] as List).cast<ToDo>(),
    );
  }

  @override
  void write(BinaryWriter writer, ProjectEntity obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.status)
      ..writeByte(4)
      ..write(obj.dueDate)
      ..writeByte(5)
      ..write(obj.teamMembers)
      ..writeByte(6)
      ..write(obj.toDos);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
