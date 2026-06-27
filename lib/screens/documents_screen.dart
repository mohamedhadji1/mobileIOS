import 'package:fluent_ui/fluent_ui.dart';
import '../theme/app_theme.dart';
import '../theme/app_widgets.dart';
import 'document_capture_screen.dart';
import 'worker_nav.dart';

/// Post-login document manager. Unlike the enrollment stepper
/// ([DocumentUploadScreen]), this is NOT a wizard: an already-enrolled worker
/// can upload or replace ANY identity document at any time. Every supported
/// document type is always listed with its current state.
///
/// ponytail: "uploaded" state is tracked in-session after a successful capture.
/// Wire it to the worker's document list from the backend when an RPC exists.
class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({super.key});

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocType {
  const _DocType(this.title, this.description, this.icon);
  final String title;
  final String description;
  final IconData icon;
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  static const List<_DocType> _docTypes = [
    _DocType('Passport', 'Main bio-data page', FluentIcons.airplane),
    _DocType('National ID (Front)', 'Front of your ID card', FluentIcons.contact_card),
    _DocType('National ID (Back)', 'Back of your ID card', FluentIcons.contact_card),
    _DocType("Driver's License (Front)", 'Front of your license', FluentIcons.car),
    _DocType("Driver's License (Back)", 'Back of your license', FluentIcons.car),
  ];

  final Set<String> _uploaded = {};

  Future<void> _capture(_DocType doc) async {
    final path = await Navigator.of(context).push<String>(
      FluentPageRoute(
        builder: (_) => DocumentCaptureScreen(documentType: doc.title),
      ),
    );
    if (path != null && mounted) {
      setState(() => _uploaded.add(doc.title));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: Container(
        color: AppTheme.bg,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(
                      AppTheme.s4, AppTheme.s4, AppTheme.s4, AppTheme.s5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: wtStagger([
                      Text('Documents', style: AppTheme.display),
                      const SizedBox(height: 4),
                      Text(
                        'Upload or replace your identity documents anytime.',
                        style: AppTheme.caption,
                      ),
                      const SizedBox(height: AppTheme.s4),
                      const WTSectionLabel('Identity documents'),
                      for (final doc in _docTypes) ...[
                        _docCard(doc),
                        const SizedBox(height: AppTheme.s2),
                      ],
                    ]),
                  ),
                ),
              ),
              WTBottomNav(items: workerNavItems(context, 1), activeIndex: 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _docCard(_DocType doc) {
    final uploaded = _uploaded.contains(doc.title);
    return WTCard(
      small: true,
      onTap: () => _capture(doc),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppTheme.accentSoft,
              borderRadius: BorderRadius.circular(AppTheme.rSm),
            ),
            child: Icon(doc.icon, color: AppTheme.accent, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doc.title,
                    style: TextStyle(
                        color: AppTheme.ink,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(doc.description,
                    style: TextStyle(color: AppTheme.faint, fontSize: 12)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          if (uploaded)
            const WTTag('Uploaded', kind: WTTagKind.green, icon: FluentIcons.check_mark)
          else
            const WTTag('Upload', kind: WTTagKind.blue, icon: FluentIcons.add),
        ],
      ),
    );
  }
}
