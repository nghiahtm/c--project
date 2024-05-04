/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
    // config.uiColor = '#AADC6E';    
    config.syntaxhighlight_lang = 'csharp';
    config.syntaxhighlight_hideControls = true;
    config.language = 'vi';
    config.filebrowserBrowseUrl = '/Public/plugin/ckfinder/ckfinder.html';
    config.filebrowserImageBrowseUrl = '/Public/plugin/ckfinder.html?Type=Images';
    config.filebrowserFlashBrowseUrl = '/Public/plugin/ckfinder.html?Type=Flash';
    //config.filebrowserUploadUrl = '/Public/plugin/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files';
    //config.filebrowserImageUploadUrl = '/Images';
    //config.filebrowserFlashUploadUrl = '/Public/plugin/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash';

    CKFinder.setupCKEditor(null, '/Public/plugin/ckfinder/');
};
CKEDITOR.editorConfig = function (config) {
    config.toolbarGroups = [
        { name: 'document', groups: ['mode', 'document', 'doctools'] },
        { name: 'clipboard', groups: ['clipboard', 'undo'] },
        { name: 'editing', groups: ['find', 'selection', 'spellchecker', 'editing'] },
        { name: 'forms', groups: ['forms'] },
        { name: 'insert', groups: ['insert'] },
        { name: 'links', groups: ['links'] },
        { name: 'paragraph', groups: ['list', 'indent', 'blocks', 'align', 'bidi', 'paragraph'] },
        { name: 'basicstyles', groups: ['basicstyles', 'cleanup'] },
        { name: 'tools', groups: ['tools'] },
        '/',
        { name: 'styles', groups: ['styles'] },
        { name: 'colors', groups: ['colors'] },
        { name: 'others', groups: ['others'] },
        { name: 'about', groups: ['about'] }
    ];

    config.removeButtons = 'Source,Save,NewPage,Scayt,Anchor,Flash,Smiley,Iframe,About,Language,SelectAll,Form,Radio,Checkbox,CreateDiv,Font,Blockquote';
};