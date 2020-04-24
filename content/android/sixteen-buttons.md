# Sixteen Buttons

## Neues Projekt erstellen

Über den Projekt-Wizard wird man durch den Erstellungsprozess geleitet. 

### Neues Projekt

Nachdem ersten Start von Android Studio ist die Ansicht, wie unten im Screenshot dargestellt, vorhanden. Dabei kann über Klick auf `+ Start a new Android Studio project` ein neues Projekt erstellt werden. 

![Projekt erstellen 1](images/01-Projekt-erstellen-1.png "Projekt erstellen 1")

Alternativ kann über die geöffnete Android Studio Projektansicht über das Menü `File > New > New Project...` ein neues Projekt erstellt werden.

### Erste Activity wählen

Ein Android Projekt besteht normalerweise zumindest aus einer Activity. Ein großes Android Projekt kann durchaus über Hundert Activities umfassen. Für ein neues Projekt kann aus ein Templates für die erste Activity gewählt werden. Für das Projekt Sixteen Buttons nutzen wird das Template `Empty Activity`.

![Projekt erstellen 2](images/01-Projekt-erstellen-2.png "Projekt erstellen 2")

### Projektkonfiguration

Im letzten Schritt des Projekt-Wizard werden wichtige Daten zum Projekt festgelegt. All diese Daten können grundsätzlich später noch verändert werden, dies ist dann aber teilweise mit aufwändigen Refactoring verbunden.

![Projekt erstellen 3](images/01-Projekt-erstellen-3.png "Projekt erstellen 3")

Folgende Parameter können festgelegt werden:

 - __Name:__ Der Name wird an allen wichtigen Stellen im Android Betriebssystem für die App angezeigt (zB am All-Apps Screen oder am Recents Screen).
 - __Package name:__ Alle Klassen des Projektes werden mit diesem Package Name versehen.
 - __Save location:__ An dieser Stelle wird das Projekt am Dateisystem gespeichert.
 - __Language:__ Native Android Apps können grundsätzlich in Java oder Kotlin entwickelt werden.
 - __Minimum SDK:__ Für Android wird zumindest jährlich eine neue Version (inkl. SDK) veröffentlicht. Die Auswahl hängt davon ab, welche älteren Android Versionen von der App noch unterstützt werden sollen.

Wählen Sie die Parameter entsprechend des Screenshots (die `Save location` ist frei wählbar) und klicken Sie auf `Finish`.

## Layout editieren

In der Datei `res/layout/activity_main.xml` findet sich das entsprechende Layout, welches für die Activity geladen wird.

!!! info "Hinweis"
    In der Klasse `MainActivity` findet man innerhalb der Methode `onCreate` das Layout, welches der Activity zugeordnet wurde. Mit der Methode `setContentView` wird über die entsprechende Konstante `R.layout.activity_main` das Layout im Ordner `res/layout/activity_main.xml` referenziert und dadurch für die Activity festgelegt. Hier könnte jedes beliebige verfügbare Layout zugeordnet werden.

Layouts werden als XML-Dokumente beschrieben. Ein Layout kann in Android Studio direkt als XML-Dokument über die Code-Ansicht oder über einen `WYSIWYG-Editor` in der Design-Ansicht editiert werden. Die Design-Ansicht bietet dabei bereits eine gerenderte Darstellung des XML-Dokumentes. Änderungen in der Design Ansicht führen aber immer zu Änderungen im XML.

<!-- Layouts sind hierarchisch aufgebaut und bestehen aus `Views` oder `ViewGroups`. `Views` (auch als UI-Widgets, UI-Controls bezeichnet) sind dabei immer Blätter des Layout-Baums. -->

Vorerst arbeiten wir nur mit der Code-Ansicht, kopieren Sie dazu den folgenden Code-Auschnitt in den Code-Editor. Der bestehende Inhalt soll dabei gelöscht werden.

```xml
<?xml version="1.0" encoding="utf-8"?>
<ScrollView xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">
    <LinearLayout
        android:id="@+id/button_layout"
        android:orientation="vertical"
        android:layout_width="match_parent"
        android:layout_height="wrap_content">
    </LinearLayout>
</ScrollView>
```

Im Layout ist das Wurzelelment eine `ScrollView`. Die `ScrollView` erzeugt die Möglichkeit des Scrollens der Kindelemente, welche nicht vollkommen auf dem Bildschirm Platz haben. Innherhalb der `ScrollView` befindet sich ein `LinearLayout`. Das `LinearLayout` ermöglicht es Kindelemente entweder vertikal oder horizontal in einer Reihe anzuordnen (siehe Attribut `android:orientation`).

!!! info "Hinweis"
    Das `LinearLayout` hat eine `android:id` als Attribut gesetzt. IDs sind sehr wichtig, da im Quellcode Elemente aus dem Layout über die ID referenziert werden können. Als Wert für IDs wird eine spezielle Syntax verwendet `@+id/beliebiger_name`. Mit `@+id` wird dabei definiert, dass in der Klasse `R` eine neue ID-Konstante erzeugt werden soll. Für den Bezeichner der ID kann ein `beliebiger_name` festgelegt werden. In der Klasse `R` wird die ID wie folgt als Konstante erzeugt: `R.id.beliebiger_name`. Weitere Details dazu finden sich in der [Dokumentation](https://developer.android.com/guide/topics/ui/declaring-layout#id).

## 16 Buttons hinzufügen

Das Layout einer Activity kann einerseit deklarativ über XML definiert werden. Andererseits können aber auch dynamische Änderungen im Layout zur Laufzeit im Quellcode (programmatisch) durchgeführt werden. Im folgenden sollen 16 Buttons innerhalb des `LinearLayout` hinzugefügt werden.

Innerhalb der Methode `onCreate` der Klasse `MainActivity` soll nun das deklarierte `LinearLayout` im Quellcode referenzirt werden. Dazu ist die Methode `findViewById` innerhalb der Activity definiert. Durch übergabe einer ID kann das entsprechende Element des Layouts abgefragt werden:

```java
LinearLayout linearLayout = findViewById(R.id.button_layout);
```

!!! info "Hinweis"
    Alle Layouts erben von der Klasse [`ViewGroup`](https://developer.android.com/reference/android/view/ViewGroup). Dies ist eine Klasse die das Verwalten von Kindelementen ermöglicht. Kindelemente einer `ViewGroup` können entweder [`Views`](https://developer.android.com/reference/android/view/View) oder wiederum `ViewGroups` (für verschachtelte Layouts) sein. Eine `ViewGroup` definiert dabei wichtige Methoden zur Verwaltung von Kindelementen. Die Methode [`addView`](https://developer.android.com/reference/android/view/ViewGroup#addView(android.view.View)) ermöglicht es Kindelemente hinzuzufügen. Die Methode [`getChildCount`](https://developer.android.com/reference/android/view/ViewGroup#getChildCount()) gibt die Anzahl der verwalteten Kindelemente zurück und die Methode [`getChildAt`](https://developer.android.com/reference/android/view/ViewGroup#getChildAt(int)) liefert eine Referenz auf ein Kindelement durch die Angabe eines Index (ähnlich zum Zugriff auf ein Array).

Innerhalb einer Schleife sollen dann 16 `Buttons` über die Methode `addView` an das `LinearLayout` hinzugefügt werden. Jede `View` (wie zum Beispiel der `Button`) bekommt eine Referenz auf die Activity in der sie ausgeführt wird, über den Konstruktur, übergeben. Ein `Button` besitzt unter anderem die Eigenschaft Text, welche über den Setter `setText` angegeben wird.

```java
for (int i = 0; i < 16; i++) {
    Button button = new Button(this);
    button.setText("Button " + (i+1));
    linearLayout.addView(buttons[i]);
}
```

!!! info "Hinweis"
    Alle `Views` besitzen Eigenschaften. Diese Eigenschaften können entweder deklarativ über XML-Attribute im Layout oder programmatisch über Setter im Quellcode definiert werden. In den meisten Fällen gibt es eine 1-zu-1 Übereinstimmung zwischen Eigentschaften im XML-Layout und über Setter der `View` (leider nicht überall). Eigenschaften können an der `View` auch über Getter abgefragt werden.

Ein Starten der App sollte ein Ähnliches Bild wie der angeführte Screenshot liefern. Wichtig ist dabei auch, dass man vertikal Scrollen kann (dies wird durch die `ScrollView` ermöglicht).

<img src="../images/01-16-Buttons.png" title="16 Buttons" alt="16 Buttons" style="max-width:260px;">

Der gesamte Inhalt der Methode `onCreate` sollte nun folgendermaßen aussehen:

```java
@Override
protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    setContentView(R.layout.activity_main);

    LinearLayout linearLayout = findViewById(R.id.button_layout);

    for (int i = 0; i < 16; i++) {
        Button button = new Button(this);
        button.setText("Button " + (i+1));
        linearLayout.addView(buttons[i]);
    }
}
```

## Klick Listener hinzufügen

Grafische Benutzeroberflächen sollen auf Aktionen von Benutzerinnen reagieren. Für eine `View` in der Oberfläche kann für definierte Events (wie zB einen Klick) ein `EventListener` angeben werden. Immmer wenn das entsprechende Event eintritt wird der zugeordnete `EventListener` ausgeführt.

Die unterschiedlichen `EventListener` sind als Java-Interfaces definiert. Eine einfache Möglichkeit, um einen entsprechenden `EventListener` zu implementieren, ist es diesen direkt über die `Activity` zu implementieren. Die `MainActivity` im Projekt sollte so erweitert werden, dass der `OnClickListener`, welcher als inneres Interface der Klasse `View` definiert ist, implementiert wird.

Nachdem hinzufügen des `implements View.OnClickListener` wird von der Klasse `MainActivity` gefordert, dass das entsprechende Interface implementiert wird. Deshalb muss die Methode `onClick` mit der definierten Methoden-Signatur hinzugefügt werden.

!!! info "Hinweis"
    Android Studio generiert alle Methoden, welche von einem Interface definiert sind. Dafür kann das Symbol "rote Glühbirne" für vorschläge geklickt werden. Dies tritt immer dort auf, wo aktuell ein Fehler von der IDE entdeckt wurde. Falls die "rote Glühbirne" nicht sichtbar ist, aber ein Fehler vorherrscht, können durch die Tastenkombination `ALT+Enter` die selben Vorschläge generiert werden. Der Cursor muss sich dafür in der Zeile mit dem Fehler befinden.

```java
public class MainActivity extends AppCompatActivity implements View.OnClickListener {
    // ...

    @Override
    public void onClick(View v) {
        // ...
    }
}
```

Die Methode `onClick` bekommt dabei eine `View` als Parameter übergeben. Diese `View` repräsentiert genau das Element der Benutzeroberfläche, auf welches geklickt wurde. Damit das Event-Handling auch funktioniert, müssen die Buttons mit dem implementierten `EventListener` verknüpft werden. Für jeden Button, der in der Schleife erzeugt wird, muss dies durchgeführt werden: 

```java
button.setOnClickListener(this);
```

Damit irgendetwas passiert nachdem Klick auf den Button, muss auch in der Methode `onClick` etwas ausgeführt werden. Dazu soll ein [`Toast`](https://developer.android.com/guide/topics/ui/notifiers/toasts) erzeugt werden, welcher eine kurze Nachricht am Bildschirm einblendet. Da bekannt ist, dass die übergebene `View` ein `Button` ist, kann auch ein entsprechenden Casting mit `(Button)` durchgeführt werden.

```java
@Override
public void onClick(View v) {
    Button button = (Button) v;
    Toast toast = Toast.makeText(this, "Klick auf " + button.getText(), Toast.LENGTH_SHORT);
    toast.show();
}
```

Durch Klicken auf `Button 6` sollte folgende Darstellung erzeugt werden:

<img src="../images/01-Toast.png" title="Toast" alt="Toast" style="max-width:260px;">

## Zufälligen Button auswählen

Um das Spiel zu realisieren, sollte ein zufälliger Button ausgewählt werden und bei diesem soll die Schriftfarbe auf Rot gesetzt werden. Dazu sollen im ersten Schritt ein `LinearLayout` als Eigenschaft der Klasse definiert werden. Mit der Methode `findViewById` soll entsprechend diese Klasseneigenschaft setzen:

```java
public class MainActivity extends AppCompatActivity implements View.OnClickListener {
    // ...
    protected LinearLayout linearLayout;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // ...
        linearLayout = findViewById(R.id.button_layout);
        // ...
    }

    // ...
```

Zur Auswahl eines zufälligen Buttons muss eine Zufallszahl zwischen 0 und 15 erzeugt werden. Mit der Methode `getChildAt` des `LinearLayout` Objektes kann über den Index eine `View` abgefragt werden. Da wir wissen, dass jede `View` ein `Button` ist, können wir auch das entsprechend casten mit `(Button)`. Die Farbe des Textes im Button wird dann auf Rot gesetzt.

```java
public void selectRandomButton() {
    int random = (int) Math.floor(Math.random() * linearLayout.getChildCount());
    Button button = (Button) linearLayout.getChildAt(random);
    button.setTextColor(Color.RED);
}
```

Die Methode `selectRandomButton` sollte dann als letztes in der Methode `onCreate` aufgerufen werden.

## Klick prüfen

Für jeden Klick soll nun geprüft werden, ob auf einen Button mit rotem Text gedrückt wurde. Falls auf einen Button mit rotem Text geklickt wurde, soll der Text wieder auf Schwarz gesetzt werden und ein anderer zufälliger Button soll wieder Rot gefärbt werden.

Die Schriftfrabe des Buttons kann über die Methode `getTextColors` abgefragt werden. Als Rückgabewert dieses Getter wird ein Objekt vom `ColorStateList` zurückgegeben. Da ein Button für unterschiedliche Zustände (zB Enabled/Disabled, Gedrückt, ...) eine andere Farbe definiert haben kann, wird eben eine `ColorSateList` verwendet. Dabei kann die Methode `getDefaultColor` der `ColorStateList` verwendet werden, um die Schriftfarbe im "Normalzustand" des Buttons abzufragen.

Im Falle einer Übereinstimmung mit der Farbe Rot (`Color.RED`) soll eben die Farbe auf Schwarz (`Color.BLACK`) gesetzt ewrden. Des Weiteren soll ein weiterer zufälliger Button Rot eingefärbt werden (`selectRandomButton`). 

```java
@Override
public void onClick(View v) {
    Button button = (Button) v;
    int color = button.getTextColors().getDefaultColor();

    if (color == Color.RED) {
        button.setTextColor(Color.BLACK);
        selectRandomButton();
    }
}
```

Im folgenden Screenshot wird ein zufällig Rot gefärbter Button angezeigt:

<img src="../images/01-Rote-Farbe.png" title="Zufälliger roter Button" alt="Zufälliger roter Button" style="max-width:260px;">

## Gesamter Quellcode

### activity_main.xml

```xml
<?xml version="1.0" encoding="utf-8"?>
<ScrollView xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:app="http://schemas.android.com/apk/res-auto"
    xmlns:tools="http://schemas.android.com/tools"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    tools:context=".MainActivity">
    <LinearLayout
        android:id="@+id/button_layout"
        android:orientation="vertical"
        android:layout_width="match_parent"
        android:layout_height="wrap_content">
    </LinearLayout>
</ScrollView>
```

### MainActivity

```java
package fhku.sixteenbuttons;

import androidx.appcompat.app.AppCompatActivity;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {

    protected LinearLayout linearLayout;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        linearLayout = findViewById(R.id.button_layout);

        for (int i = 0; i < 16; i++) {
            Button button = new Button(this);
            button.setText("Button " + (i+1));
            button.setOnClickListener(this);
            linearLayout.addView(button);
        }

        selectRandomButton();
    }

    @Override
    public void onClick(View v) {
        Button button = (Button) v;
        int color = button.getTextColors().getDefaultColor();

        if (color == Color.RED) {
            button.setTextColor(Color.BLACK);
            selectRandomButton();
        }

        // Toast toast = Toast.makeText(this, "Klick auf " + button.getText(), Toast.LENGTH_SHORT);
        // toast.show();
    }

    public void selectRandomButton() {
        int random = (int) Math.floor(Math.random() * linearLayout.getChildCount());
        Button button = (Button) linearLayout.getChildAt(random);
        button.setTextColor(Color.RED);
    }
}
```