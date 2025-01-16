import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final int index;
  final Map item;
  final Function(Map) navigateEdit;
  final Function(int) deleteById;
  const TaskCard({
    super.key,
    required this.index,
    required this.item,
    required this.navigateEdit,
    required this.deleteById,
  });

  @override
  Widget build(BuildContext context) {
    final id = item['_id'] as int;
    return Card(
      child: ListTile(
        leading: CircleAvatar(child: Text('${index + 1}')),
        title: Text(item['title']),
        subtitle: Text(item['description']),
        trailing: PopupMenuButton(onSelected: (value) {
          if (value == 'edit') {
            // Open Edit Page
            navigateEdit(item);
          } else if (value == 'delete') {
            // Delete and remove the item
            deleteById(id);
          }
        }, itemBuilder: (context) {
          return [
            PopupMenuItem(
              value: 'edit',
              child: Text('Edit'),
            ),
            PopupMenuItem(value: 'delete', child: Text('Delete')),
          ];
        }),
      ),
    );
  }
}
