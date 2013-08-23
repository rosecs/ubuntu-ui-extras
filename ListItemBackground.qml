/***************************************************************************
 * Whatsoever ye do in word or deed, do all in the name of the             *
 * Lord Jesus, giving thanks to God and the Father by him.                 *
 * - Colossians 3:17                                                       *
 *                                                                         *
 * Ubuntu UI Extras - A collection of QML widgets not available            *
 *                    in the default Ubuntu UI Toolkit                     *
 * Copyright (C) 2013 Michael Spencer <sonrisesoftware@gmail.com>             *
 *                                                                         *
 * This program is free software: you can redistribute it and/or modify    *
 * it under the terms of the GNU General Public License as published by    *
 * the Free Software Foundation, either version 3 of the License, or       *
 * (at your option) any later version.                                     *
 *                                                                         *
 * This program is distributed in the hope that it will be useful,         *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of          *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the            *
 * GNU General Public License for more details.                            *
 *                                                                         *
 * You should have received a copy of the GNU General Public License       *
 * along with this program. If not, see <http://www.gnu.org/licenses/>.    *
 ***************************************************************************/
import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1

// Widget based on code from Clock app
Rectangle {
    id: swipeBackgroundItem

    property alias iconSource: swipeDeleteIcon.source
    property alias text: swipeBackgroundText.text

    anchors.fill: parent
    //color: Theme.palette.normal.base;
    color: Qt.rgba(0.2,0.2,0.2,0.3)

    Image {
        id: swipeDeleteIcon

        property int slidingMargin: units.gu(2)

        anchors {
            top: swipeBackgroundText.top
            bottom: swipeBackgroundText.bottom
        }
        width: height
    }

    Label {
        id: swipeBackgroundText

        property int slidingMargin: units.gu(3)

        anchors {
            verticalCenter: parent.verticalCenter
        }

        width: implicitWidth

        color: Theme.palette.normal.baseText
        fontSize: "large"
    }

    states: [
        State {
            name: "SwipingRight"
            PropertyChanges {
                target: swipeBackgroundText;
                restoreEntryValues: true

                anchors.left: undefined
                anchors.right: parent.right
                anchors.rightMargin: swipeBackgroundText.slidingMargin
            }
            PropertyChanges {
                target: swipeDeleteIcon;
                restoreEntryValues: true

                anchors.right: swipeBackgroundText.left
                anchors.rightMargin: swipeDeleteIcon.slidingMargin
                anchors.left: undefined
            }
        },

        State {
            name: "SwipingLeft"
            PropertyChanges {
                target: swipeBackgroundText;
                restoreEntryValues: true

                anchors.right: undefined
                anchors.left: parent.left
                anchors.leftMargin: swipeBackgroundText.slidingMargin
            }
            PropertyChanges {
                target: swipeDeleteIcon;
                restoreEntryValues: true

                anchors.left: swipeBackgroundText.right
                anchors.leftMargin: swipeDeleteIcon.slidingMargin
                anchors.right: undefined
            }
        }
    ]
}