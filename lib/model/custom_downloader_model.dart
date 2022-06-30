import 'package:flutter_testaliplayer/config.dart';

///自定义下载类
class CustomDownloaderModel {
  static const String VID = "mVideoId";
  static const String TITLE = "mTitle";
  static const String COVERURL = "mCoverUrl";
  static const String INDEX = "mIndex";
  static const String FILESIZE = "mVodFileSize";
  static const String FORMAT = "mVodFormat";
  static const String DEFINITION = "mVodDefinition";
  static const String SAVEPATH = "mSavePath";
  static const String DOWNLOADMSG = "mDownloadMsg";
  static const String DOWNLOADMODETYPE = "mDownloadModeType";
  static const String DOWNLOADSTATE = "mDownloadState";

  String? videoId;
  String? title;
  String? coverUrl;
  int? index;
  int? vodFileSize;
  String? vodFormat;
  String? vodDefinition;
  String? savePath;
  String? stateMsg;
  ModeType? downloadModeType;
  DownloadState? downloadState;

  CustomDownloaderModel(
      {this.videoId, this.title, this.coverUrl, this.index, this.vodFileSize, this.vodFormat, this.vodDefinition, this.savePath, this.stateMsg = '准备完成', this.downloadModeType, this.downloadState});

  CustomDownloaderModel.fromJson(Map<String, dynamic> jsonMap) {
    videoId = jsonMap[VID];
    title = jsonMap[TITLE];
    coverUrl = jsonMap[COVERURL];
    index = jsonMap[INDEX];
    vodFileSize = num.parse(jsonMap[FILESIZE]) as int?;
    vodFormat = jsonMap[FORMAT];
    vodDefinition = jsonMap[DEFINITION];
    stateMsg = jsonMap[DOWNLOADMSG];
    savePath = jsonMap[SAVEPATH];
    int state = jsonMap[DOWNLOADSTATE];
    if (state == DownloadState.PREPARE.index) {
      downloadState = DownloadState.PREPARE;
    } else if (state == DownloadState.START.index) {
      downloadState = DownloadState.START;
    } else if (state == DownloadState.STOP.index) {
      downloadState = DownloadState.STOP;
    } else if (state == DownloadState.COMPLETE.index) {
      downloadState = DownloadState.COMPLETE;
    } else {
      downloadState = DownloadState.ERROR;
    }
    int modeState = jsonMap[DOWNLOADMODETYPE];
    if (modeState == ModeType.STS.index) {
      downloadModeType = ModeType.STS;
    } else if (modeState == ModeType.AUTH.index) {
      downloadModeType = ModeType.AUTH;
    } else {
      downloadModeType = ModeType.STS;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data[VID] = videoId;
    data[TITLE] = title;
    data[COVERURL] = coverUrl;
    data[INDEX] = index;
    data[FILESIZE] = vodFileSize;
    data[FORMAT] = vodFormat;
    data[DEFINITION] = vodDefinition;
    data[SAVEPATH] = savePath;
    data[DOWNLOADMSG] = stateMsg;
    data[DOWNLOADSTATE] = downloadState?.index;
    data[DOWNLOADMODETYPE] = downloadModeType?.index;
    return data;
  }
}

enum DownloadState { PREPARE, START, STOP, COMPLETE, ERROR }
