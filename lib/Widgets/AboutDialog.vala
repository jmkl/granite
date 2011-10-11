//  
//  Copyright (C) 2011 Adrien Plazas
// 
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//  
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
// 
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
// 
// 
//  Authors:
//      Adrien Plazas <kekun.plazas@laposte.net>
//  Artists:
//      Daniel Foré <daniel@elementaryos.org>
// 

using Gtk;

public class Granite.Widgets.AboutDialog : Granite.GtkPatch.AboutDialog
{
    /**
     * The URL for the link to the website of the program.
     */
    public string help {
        set {
            _help = value;
            help_button.sensitive = !(_help == null || _help == "");
        }
        get { return _help; }
    }
    string _help = "";

    /**
     * The URL for the link to the website of the program.
     */
    public string translate {
        set {
            _translate = value;
            translate_button.sensitive = !(_translate == null || _translate == "");
        }
        get { return _translate; }
    }
    string _translate = "";

    /**
     * The URL for the link to the website of the program.
     */
    public string bug {
        set {
            _bug = value;
            bug_button.sensitive = !(_bug == null || _bug == "");
        }
        get { return _bug; }
    }
    string _bug = "";

    Button help_button;
    Button translate_button;
    Button bug_button;

    /**
     * Creates a new Granite.AboutDialog
     */
    public AboutDialog()
    {
        Box action_area = (Box)get_action_area();

        /* help button */
        help_button = new Button.with_label(" ? ");
        help_button.get_style_context ().add_class ("help_button");
        help_button.halign = Gtk.Align.CENTER;
        /* FIXME test & discuss and fix this ugly hack */
        help_button.set_size_request (25, -1);
        help_button.pressed.connect(() => { activate_link(help); });
        action_area.pack_end (help_button, false, false, 0);
        ((Gtk.ButtonBox) action_area).set_child_secondary (help_button, true);
        ((Gtk.ButtonBox) action_area).set_child_non_homogeneous (help_button, true);

        /* translate button */
        translate_button = new Button.with_label("Translate this app");
        translate_button.pressed.connect(() => { activate_link(translate); });
        action_area.pack_start (translate_button, false, false, 0);

        /* bug button */
        bug_button = new Button.with_label("Report a problem");
        bug_button.pressed.connect(() => { activate_link(bug); });
        action_area.pack_start (bug_button, false, false, 0);

        action_area.reorder_child(bug_button, 0);
        action_area.reorder_child(translate_button, 0);

        action_area.show_all();

    }
}