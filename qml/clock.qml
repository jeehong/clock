import QtQuick 2.4

Item {
    id: clock
    x: 0
    y: 0
    width: 500
    height: 500
    opacity: 1
    property int hourValue: DigitalClock.hour;
    property int minValue: DigitalClock.min;
    property int secValue: DigitalClock.sec;

    // module clock
    Image {
        id: body
        x: 88
        y: 72
        opacity: 1.0
        source: "qrc:/images/pic/body.png"
    }
    Image {
        id: hour
        x: 247
        y: 147
        opacity: 1.0
        source: "qrc:/images/pic/hour.png"

        transform: Rotation {
            id: hourFinger
            origin.x: 6
            origin.y: 78   //79 * 8
            angle: 0
            //Behavior on angle { SpringAnimation { spring: 2.5; damping: 0.2; epsilon: 0.25 } }
        }
    }
    Image {
        id: min
        x: 247
        y: 110
        opacity: 1.0
        source: "qrc:/images/pic/min.png"

        transform: Rotation {
            id: minFinger
            origin.x: 5
            origin.y: 115   //79 * 8
            angle: 0
            //Behavior on angle { SpringAnimation { spring: 2.5; damping: 0.2; epsilon: 0.25 } }
        }
    }
    Image {
        id: center
        x: 246
        y: 218
        opacity: 1.0
        source: "qrc:/images/pic/center.png"
    }

    SequentialAnimation {
        id: clockAnimation
        ScriptAction { script:{ minFinger.angle = Qt.binding(function() { return minValue * 6 + secValue / 10; });}}
        ScriptAction { script:{ hourFinger.angle = Qt.binding(function() { return hourValue * 30 + minValue / 2; });}}

    }
    Component.onCompleted: {

        clockAnimation.start();
    }
}
