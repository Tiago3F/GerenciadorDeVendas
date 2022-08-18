package logger

import (
	"encoding/json"
	"time"

	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
)

func customTimeEncoder(t time.Time, enc zapcore.PrimitiveArrayEncoder) {
	enc.AppendString(t.UTC().String()[0:22])
}

func Init() (*zap.Logger, error) {
	rawJSON := []byte(`{
	  "level": "debug",
	  "encoding": "json",
	  "__outputPaths": ["shared/logger/tmp/logs.log", "stdout"],
	  "outputPaths": ["stdout"],
	  "errorOutputPaths": ["stderr"],
	  "initialFields": {},
	  "encoderConfig": {
	    "timeKey": "time",
	    "messageKey": "msg",
	    "levelKey": "lvl",
	    "levelEncoder": "lowercase"
	  }
	}`)

	var cfg zap.Config

	cfg.EncoderConfig.EncodeTime = customTimeEncoder

	if err := json.Unmarshal(rawJSON, &cfg); err != nil {
		return nil, err
	}

	logger, err := cfg.Build()
	if err != nil {
		return nil, err
	}

	defer logger.Sync()
	return logger, nil

}
