
# Dependências e Acesso a Recursos do Dispositivo com Flutter

## 🎯 Visão Técnica do Projeto

Este repositório demonstra, de forma prática e arquitetural, como o Flutter gerencia:

- Dependências (Packages e Plugins)
- Ciclo de resolução e versionamento
- Integração com SDKs nativos
- Acesso a recursos do dispositivo
- Comunicação via Platform Channels

O objetivo não é apenas uso de bibliotecas, mas compreender como o ecossistema Flutter se conecta às APIs do sistema operacional.

## 1️⃣ Gerenciamento de Dependências no Flutter

O gerenciamento de dependências no Flutter é realizado através do **Pub Package Manager**, utilizando o arquivo `pubspec.yaml`, onde são declaradas as bibliotecas do projeto, suas versões e as restrições de compatibilidade. A resolução das dependências é feita de forma determinística, garantindo consistência entre ambientes por meio do arquivo `pubspec.lock`, que registra as versões exatas utilizadas no projeto.

Ao executar:

```bash
flutter pub get
````

o Flutter analisa o `pubspec.yaml`, resolve o grafo de dependências, baixa os pacotes do repositório oficial (pub.dev) e gera ou atualiza o `pubspec.lock`, assegurando reprodutibilidade do build.

Dependências podem ser adicionadas e removidas diretamente pelo terminal:

```bash
flutter pub add nome_do_pacote
flutter pub remove nome_do_pacote
```

Esses comandos atualizam automaticamente o `pubspec.yaml` e executam a resolução das dependências.

A atualização de versões dentro das constraints definidas ocorre com:

```bash
flutter pub upgrade
```

Para verificar versões disponíveis:

```bash
flutter pub outdated
```

Caso seja necessário limpar artefatos de build:

### Constraints de Versão

As versões das dependências podem ser definidas por meio de **constraints**, que determinam quais versões são permitidas no projeto.

| Forma              | Significado                                                               |
| ------------------ | ------------------------------------------------------------------------- |
| `^6.1.0`           | Permite atualizações compatíveis dentro do mesmo major (>=6.1.0 e <7.0.0) |
| `">=6.1.0 <7.0.0"` | Intervalo explícito equivalente ao `^`                                    |
| `">=6.1.0"`        | Permite qualquer versão maior ou igual                                    |
| `6.1.0`            | Versão fixa                                                               |
| `any`              | Permite qualquer versão disponível                                        |

O operador `^` é o padrão recomendado, pois permite atualizações seguras dentro da mesma versão principal, mantendo estabilidade e previsibilidade do projeto.

---

# 2️⃣ Acesso a Recursos do Dispositivo

O Flutter **não acessa hardware diretamente**.

A arquitetura funciona assim:

```
Flutter (Dart)
   ↓
Plugin
   ↓
Platform Channel
   ↓
SDK Nativo (Android/iOS)
   ↓
Hardware
```

O acesso ocorre por meio de **plugins**, que fazem a ponte entre o Dart e o código nativo.


### Exemplo: Câmera

```yaml
camera: ^1.0.0
```

Utiliza APIs nativas: Android Camera API / iOS AVFoundation

Permite: Tirar fotos

### Exemplo: Localização

```yaml
geolocator: ^11.0.0
```

Utiliza: Android Location Services e CoreLocation (iOS)

Permite: Obter localização atual, Monitorar posição, Trabalhar com latitude e longitude e Calcular distância entre pontos

### Exemplo: Áudio

```yaml
just_audio: ^0.9.0
```

Permite: Reproduzir áudio local ou remoto, Controlar play, pause e stop, Streaming, Gerenciar fila de reprodução


### Exemplo: Shimmer (Skeleton Loading)

```yaml
shimmer: ^3.0.0
```

Usado para criar **efeito de carregamento animado** (skeleton screen).

Aplicações comuns: Listas carregando dados, Cards de conteúdo e Telas de feed

### Exemplo: Animações de Loading

```yaml
loading_animation_widget: ^1.0.0
```

Fornece diversos tipos de animações de carregamento prontas, como: Bolinhas, Spins e Efeitos visuais modernos

Muito útil para:

* Botões em estado de loading
* Processos assíncronos
* Feedback visual durante requisições


### 🔐 Permissões (Importante)

Recursos sensíveis exigem configuração nas plataformas.

### 📱 Android

Devem ser declaradas no:

```
AndroidManifest.xml
```

Além disso, muitas precisam ser solicitadas em tempo de execução.


### 🍎 iOS

Devem ser declaradas no:

```
Info.plist
```

E é obrigatório informar o motivo do uso da permissão, como câmera, localização ou microfone.

---

# 3️⃣ Platform Channels

Platform Channels permitem comunicação direta entre Flutter e código nativo.

Aqui será demonstrado um exemplo mais completo que:

* Envia dados do Flutter
* Processa no Android
* Retorna resultado estruturado
* Executa lógica real

## 🎯 Exemplo: Obter Nível de Bateria do Dispositivo

Este exemplo não é apenas print — ele acessa API nativa.

## 📱 Flutter (Dart)

```dart
import 'package:flutter/services.dart';

class BatteryService {
  static const MethodChannel _channel =
      MethodChannel('com.exemplo/battery');

  static Future<int> getBatteryLevel() async {
    final int level =
        await _channel.invokeMethod('getBatteryLevel');
    return level;
  }
}
```

Uso:

```dart
final batteryLevel = await BatteryService.getBatteryLevel();
```

## 🤖 Android (Kotlin)

No `MainActivity.kt`:

```kotlin
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val CHANNEL = "com.exemplo/battery"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                if (call.method == "getBatteryLevel") {

                    val batteryLevel = getBatteryLevel()

                    if (batteryLevel != -1) {
                        result.success(batteryLevel)
                    } else {
                        result.error("UNAVAILABLE", "Battery level not available.", null)
                    }
                }
            }
    }

    private fun getBatteryLevel(): Int {
        val batteryManager =
            getSystemService(BATTERY_SERVICE) as BatteryManager
        return batteryManager.getIntProperty(
            BatteryManager.BATTERY_PROPERTY_CAPACITY
        )
    }
}
```